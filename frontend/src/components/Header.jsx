/** @jsx jsx */
import {jsx} from '@emotion/react'
import { css } from '@emotion/css'
import * as React from 'react'
import { Link } from 'react-router-dom'
import { Cart3, Search } from 'react-bootstrap-icons'
import { Button } from './lib'
import * as colors from '../styles/colors'

const LinkStyle = css({
  color: colors.purple20,
  fontSize: '1.1rem'
})

function Header({title}) {

  return (
    <>
      <header css={{
        padding: '10px 20px',
        display: 'flex',
        backgroundColor: colors.yellow,
        flexDirection: 'row',
        alignItems: 'center',
        justifyContent: 'space-between',
        width: '100%',
        borderBottom: `0.5px solid ${colors.purple}`
      }}>
        <h1 css={{color: colors.purple20}}>{title}</h1>
        <div>
          <Button variant='secondary' onClick={() => alert('search clicked')}>
            <Search  size='25'/>
          </Button>
          <Button variant='secondary' onClick={() => alert('cart clicked')}>
            <Cart3  size='25'/>
          </Button>
        </div>
      </header>
      <div css={{
        padding: '5px 20px',
        display: 'flex',
        gap: '1rem',
        alignItems: 'center',
        borderBottom: `0.5px solid ${colors.purple}`
      }}>
        <Link className={LinkStyle} to="/tienda">Tienda</Link>
        <Link className={LinkStyle} to="/contacto">Contacto</Link>

      </div>
    </>
  )
}

Header.defaultProps = {
  title: 'Huma'
};

export default Header;