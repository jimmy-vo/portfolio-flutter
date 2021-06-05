import React from 'react'
import styles from './style.module.scss'
const today = new Date()
const formatted_date = `${today.toDateString()} - ${today.toLocaleTimeString()}`
 
const SectionFooter = (props) => {
   return(
    <div className={styles.footer}>
      <div className={styles.left}>{props.children.left.replace("{time}", formatted_date) }</div>
      <div className={styles.center}>{props.children.center.replace("{time}", formatted_date) }</div>
      <div className={styles.right}>{props.children.right.replace("{time}", formatted_date) }</div>
    </div>
  )
}

export default SectionFooter