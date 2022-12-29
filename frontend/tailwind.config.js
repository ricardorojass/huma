/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{html,js}"],
  theme: {
    extend: {
      colors: {
        purple: {
          default: '#B5AED5',
          darker1: '#968FB5',
          darker2 : '#5C558B'
        },
        yellow: {
          default: '#FFCB57'
        }
      }
    },
  },
  plugins: [],
}