import { social } from "./data"

export const getSectionRoute = (sectionId) => {
    return `${social[3].url}/profile#section-${sectionId}`
}


export const getSectionItemRoute = (sectionId, itemId) => {
    return `${social[3].url}/profile#section-${sectionId}-${itemId}`
}


// module.exports = { getSectionRoute, getSectionItemRoute };