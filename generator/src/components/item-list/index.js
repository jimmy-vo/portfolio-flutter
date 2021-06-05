import React from 'react'
import styles from './style.module.scss'


const ItemList = (props) => {
  return (
    <ul className={styles.listItems}>
      {
        props.children.map((bullet, bulletId) => {
          return props.hiddenBullets.map(x=>`${x}`).includes(`${props.descriptionId}.${bulletId}`)? null : <li key={bulletId}>{bullet}</li>
        })
      }
    </ul>
  )
}

export default ItemList