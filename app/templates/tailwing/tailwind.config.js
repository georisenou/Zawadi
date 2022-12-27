/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "../*.html",
    "../**/*.html",
    './node_modules/flowbite/**/*.js',
    '../../../**/templates/**/*.html'
  ],
  theme: {
    extend: {},
  },
  plugins: [
    require('flowbite/plugin')
  ],
}
