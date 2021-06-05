import React from 'react'
import styles from './style.module.scss'

import SectionInfo from "../section-info"
import SectionNormal from "../section-normal"
import SectionGrid from "../section-grid"
import SectionFooter from "../section-footer"
import {layout} from "../../services/data"



const Page = () => {
  return (
    <React.Fragment> {
      layout.map((page, pageIndex) => {
        return (
          <div className={styles.page} key={`page-${pageIndex}`}>{
            page.map((item, itemId) => {
              let itemKey = `item-${pageIndex}-${itemId}`
              switch (item.type) {
                case 'Info':
                  return (
                    <div className={styles.section} key={itemKey}>
                      <SectionInfo/>
                    </div>)
                case 'NormalView':
                  return (
                    <div className={styles.section}  key={itemKey}>
                      <SectionNormal>{item}</SectionNormal>
                    </div>)

                case 'GridView':
                  return (
                    <div className={styles.section}  key={itemKey}>
                      <SectionGrid>{item}</SectionGrid>
                    </div>)
                case 'Footer':
                  return (
                    <div className={styles.footer}  key={itemKey}>
                      <SectionFooter>{item}</SectionFooter>
                    </div>)
                default:
                  throw new Error("Invalid component")
              }
            })
          }
          </div>
        )
      })
    }
    </React.Fragment>
  )
}

export default Page