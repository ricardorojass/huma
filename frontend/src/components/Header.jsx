import * as React from 'react'
import { Link } from 'react-router-dom'
// import { Button } from './lib'
import * as colors from '../styles/colors'

{/* <header css={{
  padding: '10px 20px',
  display: 'flex',
  backgroundColor: colors.yellow,
  flexDirection: 'row',
  alignItems: 'center',
  justifyContent: 'space-between',
  width: '100%',
  borderBottom: `0.5px solid ${colors.purple}`
}}> */}
function Header({title}) {

  return (
    <>
      <header className="bg-white">
        <div className="flex justify-between items-center">
          <div className="text-2xl">{title}</div>
          <button variant='secondary' onClick={() => alert('search clicked')}>
            {/* <Search  size='25'/> */}
          </button>
          <button variant='secondary' onClick={() => alert('cart clicked')}>
            {/* <Cart3  size='25'/> */}
          </button>
        </div>
      </header>
      <div>
        <Link to="/tienda">Tienda</Link>
        <Link to="/contacto">Contacto</Link>

      </div>
    </>
  )
}

Header.defaultProps = {
  title: 'Huma'
};

export default Header;