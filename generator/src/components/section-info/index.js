import React from 'react'
import styles from './style.module.scss'
import { social, name } from '../../services/data'

const SectionInfo = () => {
  return (
    <div>
      <div className={styles.title}>
        <h1 className={styles.h1}>{name}</h1>
      </div>
      <ol className={styles.social}>{social.map((item, itemId) => {
        const icon = require(`../../../../data/${item.icon}`)
        return (
          <div className={styles.column} key={`column-${itemId}`}>
            <div> <img className={styles.icon} src={icon} alt="" /></div>
            <div><a href={item.url}> {item.text}</a></div>
          </div>
        )
      })}
      </ol>
    </div>
  )
}
export default SectionInfo