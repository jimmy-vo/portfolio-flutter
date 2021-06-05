module.exports = {
  plugins: [
    'gatsby-plugin-sass',
    `gatsby-transformer-sharp`,
    {
      resolve: `gatsby-plugin-env-variables`,
      options: {
        whitelist: ["CONFIG_PDF", "DATA_PATH"]
      },
    },
    {
      resolve: `gatsby-source-filesystem`,
      options: {
        name: `data`,
        path: `../data/`,
        ignore: [`*.md`], // ignore files starting with a dot
      },
    },
  ],
}



