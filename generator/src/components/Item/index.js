import React from 'react'
import ItemList from '../item-list'
import styles from './style.module.scss'
import {getSectionItemRoute} from '../../services/route'

const Description = (props) => {
  const hasDescription = (!props.hiddenKeys.includes("description")) && (typeof props.children.description === `object`)
  return (
    <React.Fragment>
      {hasDescription && props.children.description.map((description, descriptionId) => {
        const hasText = (!props.hiddenKeys.includes("text")) && (typeof description.text === `string`)
        const hasBullet = (!props.hiddenKeys.includes("bullet")) && (typeof description.bullet === `object`)
        return (
          <div key={`description-${descriptionId}`} className={styles.description}>
            {!hasText ? undefined : <div key={`text-${descriptionId}`}>{description.text}</div>}
            {!hasBullet 
              ? undefined
              : <ItemList 
                  hiddenBullets={props.hiddenBullets} 
                  descriptionId={descriptionId} 
                  key={`bullet-${descriptionId}`}>{description.bullet}
                </ItemList>}
          </div>
        )
      })}
    </React.Fragment>
  )
}

const Info = (props) => {
  const hasOrganization = (!props.hiddenKeys.includes("organization")) && (typeof props.children.organization === `string`)
  const hasLocation = (!props.hiddenKeys.includes("location")) && (typeof props.children.location === `string`)
  return (
    <React.Fragment >
      {
        ((!hasOrganization) && (!hasLocation)) ? undefined : 
          <div className={styles.infoGroup}>
            {!hasOrganization ? undefined: <div  className={styles.organization}>{props.children.organization}</div> }
            {!hasLocation ? undefined : <div  className={styles.location}>({props.children.location})</div> }
          </div>
      }
    </React.Fragment>
  )
}

const Title = (props) => {
  const hasTitle = (!props.hiddenKeys.includes("title")) && (typeof props.children.title === `string`)
  const hasDate = (!props.hiddenKeys.includes("date")) && (typeof props.children.date === `string`)
  return (
    <React.Fragment >
      {
        ((!hasTitle) && (!hasDate)) ? undefined : 
          <div className={styles.titleGroup}>
            {!hasTitle ? undefined: <a  className={styles.title} href={getSectionItemRoute(props.sectionId, props.children.id)}>{props.children.title}</a> }
            {!hasDate ? undefined : <div  className={styles.date}>{props.children.date}</div> }
          </div>
      }
    </React.Fragment>
  )
}

const Item = (props) => {
  return (
    <React.Fragment>
      <div className={styles.wrapper}>
        <Title hiddenKeys={props.hiddenKeys} sectionId={props.sectionId}>{props.children}</Title>
        <Info hiddenKeys={props.hiddenKeys}>{props.children}</Info>
        <Description 
          hiddenKeys={props.hiddenKeys} 
          hiddenBullets={props.hiddenBullets}>{props.children}
        </Description>
      </div>

    </React.Fragment>
  )
}

export default Item