/** @jsx jsx */
import * as React from 'react'
import { css, jsx } from '@emotion/react'
import { Link } from 'react-router-dom'
import { Button, Input, FormGroup } from './lib'
import * as colors from '../styles/colors'

const baseLink = css({
  color: `${colors.text}`,
  fontWeight: '700',
})
const commonLink = css({
  paddingLeft: '10px'
})

function Header({title}) {

  return (
    <header css={{
      backgroundColor: colors.orange.orange2,
      width: '100%',
      borderBottom: `0 solid ${colors.orange.orange2}`
    }}>
      <div css={{
        display: 'flex',
        padding: '16px',
        flexDirection: 'row',
        alignItems: 'center',
        justifyContent: 'space-between',
      }}>
        <nav>
          <a href="/shop" css={baseLink}>Huma</a>
          <a href="#" css={[baseLink, commonLink]}
          >Lineas</a>
          <a href="#" css={[baseLink, commonLink]}>Nuevos</a>
          <a href="#" css={[baseLink, commonLink]}>Blog</a>
        </nav>
        <div css={{
          background: `${colors.base}`,
          borderRadius: '999px',
          paddingLeft: '20px',
          paddingRight: '20px',
        }}>
          <div css={{
          }}>
            <button type="submit">
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 17 17" className="fill-current w-4 h-4 object-contain">
                <path d="M16.3 14.2L11.9 10.6C12.7 9.5 13.2 8.1 13.2 6.6 13.2 3 10.2 0 6.6 0 3 0 0 3 0 6.6 0 10.3 3 13.2 6.6 13.2 8.1 13.2 9.5 12.7 10.6 11.9L14.1 16.4C15 17.3 16 17.1 16.6 16.4 17.1 15.7 17.2 15 16.3 14.2ZM6.6 11.2C4.1 11.2 2 9.1 2 6.6 2 4.1 4.1 2 6.6 2 9.1 2 11.2 4.1 11.2 6.6 11.2 9.1 9.1 11.2 6.6 11.2Z"></path>
              </svg>
            </button>
            <Input className="" type="text" />
          </div>
        </div>
        <nav>
          <a href="#" css={baseLink}
          >Lineas</a>
          <a href="#" css={[baseLink, commonLink]}>Nuevos</a>
          <a href="#" css={[baseLink, commonLink]}>Blog</a>
        </nav>
      </div>
    </header>
  )
}

Header.defaultProps = {
  title: 'Huma'
};

export default Header;