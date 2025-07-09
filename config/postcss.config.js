module.exports = {
  plugins: [
    require('postcss-import'),
    require('tailwindcss/nesting'),
    require('tailwindcss')({ config: './config/tailwind-active_admin.config.js' }),
    require('autoprefixer'),
  ],
}
