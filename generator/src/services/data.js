
const sections = require("../../../data/sections.json")
const layout = require("../../../data/pdf.json")[process.env.CONFIG_PDF]
let rawContact = require("../../../data/contact.json")

const name = rawContact.name;
const social = rawContact.social[process.env.CONFIG_PDF]

module.exports = { sections, name, social, layout };