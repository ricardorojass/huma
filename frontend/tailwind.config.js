/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./src/**/*.{js,jsx}'],
  theme: {},
  plugins: [require('daisyui')],

  // daisyUI config
  daisyui: {
    styled: true,
    themes: [
      {
        huma: {
          primary: '#5C558B',
          secondary: '#FFCB57',
          accent: '#37CDBE',
          neutral: '#3D4451',
          'base-100': '#FFFFFF',
          'base-200': '#FBF7F3',
          info: '#8DC1F2',
          success: '#8FBE93',
          warning: '#B88F0A',
          error: '#F87272',
        },
      },
    ],
  },
};
