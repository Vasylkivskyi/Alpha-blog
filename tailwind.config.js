module.exports = {
  content: [
    "./app/views/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/assets/stylesheets/**/*.css",
    "./app/javascript/**/*.js",
  ],
  theme: {
    extend: {
      // that is animation class
      animation: {
        fade: "fadeOut 5s ease-in-out",
      },

      // that is actual animation
      keyframes: (theme) => ({
        fadeOut: {
          "0%": { opacity: 1 },
          "100%": { opacity: 0 },
        },
      }),
    },
  },
};
