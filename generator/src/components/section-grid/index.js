import React from 'react'
import styles from './style.module.scss'
import Item from '../Item'
import { sections } from '../../services/data'
import { getSectionRoute } from '../../services/route'

const SectionGridItems = (props) => {

  let itemIds = props.children.itemIds;
        
  return (
    Object.keys(itemIds).reverse().map((itemId, index) => {
      return (
        props.section.items
          .filter(item => (`${itemId}` === `${item.id}`))
          .map((item) => {
            let isBreak = (index < parseInt(props.children.breakItem))
            let hidden = props.isFirst ? !isBreak : isBreak
            return (
              (hidden) ? undefined :
              <Item
                key={`column1-${props.children.sectionId}-${item.id}`}
                hiddenKeys={props.children.hiddenKeys}
                hiddenBullets={itemIds[itemId]}
                sectionId={props.children.sectionId}
              >{item}
              </Item>
            )
          })
      )
    })
  )
}

const SectionGrid = (props) => {
  return (
    <div className={styles}>
      {sections
        .filter(section => {
          return (`${props.children.sectionId}` === `${section.id}`)
        })
        .map(section => {
          return (
            <React.Fragment key={section.id}>
              <h3><a className={styles.name} href={getSectionRoute(section.id)}>{section.name}</a></h3>
              <div style={
                {
                  display: "grid",
                  gridTemplateColumns: `${props.children.firstFraction}fr 1fr`
                }
              }>
                <div className={styles.flexLayout}>
                  <SectionGridItems isFirst={true} section={section}>{props.children}</SectionGridItems>
                </div>
                <div className={styles.flexLayout}>
                  <SectionGridItems isFirst={false} section={section}>{props.children}</SectionGridItems>
                </div>

              </div>

            </React.Fragment>
          )
        })}
    </div>
  )
}

export default SectionGrid