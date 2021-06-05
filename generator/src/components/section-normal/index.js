import React from 'react'
import styles from './style.module.scss'
import Item from '../Item'
import { sections } from '../../services/data'
import { getSectionRoute } from '../../services/route'

const SectionNormal = (props) => {
  return (
    sections
      .filter(section => {
        return (`${props.children.sectionId}` === `${section.id}`)
      })
      .map((section) => {
        let itemIds = props.children.itemIds;
        
        return (
          <React.Fragment key={section.id}>
            <h3><a className={styles.name} href={getSectionRoute(section.id)}>{section.name}</a></h3>

            <div >{
              Object.keys(itemIds).reverse().map((itemId, index) => {
                return (
                  section.items
                    .filter(item => (`${itemId}` === `${item.id}`))
                    .map((item) => {
                      return (
                        <Item
                          hiddenKeys={props.children.hiddenKeys}
                          hiddenBullets={itemIds[itemId]}
                          sectionId={props.children.sectionId}
                          key={`${section.id}-${item.id}`}>{item}
                        </Item>
                      )
                    })
                )
              })
            }
            </div>
          </React.Fragment>
        )
      })
  )
}

export default SectionNormal