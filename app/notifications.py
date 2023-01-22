import json

from app.models import ZawadiDetail
from .views import get_value
import requests

PHONE_NUMBER_ID = get_value('WHATSAPP_PHONE_NUMBER_ID')

ACCESS_TOKEN = get_value('WHATSAPP_ACCESS_TOKEN')

ENDPOINT = f'https://graph.facebook.com/v15.0/{PHONE_NUMBER_ID}/messages'

HEADERS = {
    'Authorization': f'Bearer {ACCESS_TOKEN}',
    'Content-Type': 'application/json'
}


def send_messages(data, slug):
    resp = requests.post(url=ENDPOINT, headers=HEADERS, data=data)
    logs = ZawadiDetail.objects.get(key = 'whatsapp_logs')
    logs.value += f"$${slug}:<!0{json.dumps(resp)}0!>"
    logs.save()
    return resp


def get_slug(dem, seller):
    return f"{seller.pk}-{dem.pk}"


def get_message_data(dem, seller):
    data = {
        "messaging_product": "whatsapp",
        "recipient_type": "individual",
        "to": f"{seller.format_number}",
        "type": "text",
        "text": {
            "preview_url": True,
            "body": f"*Nouvelle demande de {dem.subs.name}* \n Veuillez repondre à la demande du client. https://vendeur.zawadi.site/clients/0/"
        }
    }
    return data


def get_template_message_data(dem, seller):
    data = {
        "messaging_product": "whatsapp",
        "recipient_type": "individual",
        "to": f"{seller.format_number}",
        "type": "template",
        "template": {
            "namespace" : "8bd0d6ca_a028_4731_95c6_44e2d197bb4b",
            "name": "demand_alert",
            "language": {
                "code": "fr"
            },
            "components": [
                {
                    "type": "body",
                    "parameters": [
                        {
                            "type": "text",
                            "text": dem.subs.name
                        }
                    ]
                }
            ]
        }
    }
    return data


def send_whatsapp_notif(seller, dem) :
    if seller.format_number :
        send_messages(get_template_message_data(dem, seller), get_slug(dem, seller))
    