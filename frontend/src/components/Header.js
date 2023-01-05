/** @jsx jsx */
import { CiShoppingCart } from 'react-icons/ci'
import { css, jsx } from '@emotion/react'
import { Button, Input, FormGroup } from './lib'

function Header({title}) {

  return (
    <header className="bg-base-200">
      <div className="p-6 navbar">
        <div className="navbar-start z-100">
          <div className="dropdown">
            <label tabIndex={0} className="btn btn-ghost lg:hidden">
              <svg xmlns="http://www.w3.org/2000/svg" className="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M4 6h16M4 12h8m-8 6h16" /></svg>
            </label>
            <ul tabIndex={0} className="p-2 mt-3 shadow menu menu-compact dropdown-content bg-base-100 rounded-box w-52">
              <li tabIndex={0}>
                <a className="justify-between font-bold text-text md:hover:text-secondary">
                  Lineas
                  <svg className="fill-current" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M8.59,16.58L13.17,12L8.59,7.41L10,6L16,12L10,18L8.59,16.58Z"/></svg>
                </a>
                <ul className="p-6 leading-8 bg-base-100 rounded-3xl">
                  <li><a href="#" className="pt-1 md:hover:text-secondary">Facial</a></li>
                  <li><a href="#" className="pt-1 md:hover:text-secondary">Capilar</a></li>
                  <li><a href="#" className="pt-1 md:hover:text-secondary">Bienestar</a></li>
                </ul>
              </li>
              <li><a>Item 2</a></li>
              <li><a>Item 3</a></li>
            </ul>
          </div>
          <a href="/" className="font-bold text-text">Huma</a>
          <div className="hidden lg:flex">
            <ul className="px-4 menu menu-horizontal">
              <li tabIndex={0}>
                <a className="font-bold text-text md:hover:text-secondary">
                  Lineas
                  <svg className="fill-current" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"><path d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z"/></svg>
                </a>
                <ul className="p-6 leading-8 bg-base-100 rounded-3xl w-52">
                  <li><a href="#" className="pt-1 md:hover:text-secondary">Facial</a></li>
                  <li><a href="#" className="pt-1 md:hover:text-secondary">Capilar</a></li>
                  <li><a href="#" className="pt-1 md:hover:text-secondary">Bienestar</a></li>
                  <li><a href="#" className="pt-1 md:hover:text-secondary">Aceites Esenciales</a></li>
                </ul>
              </li>
              <li><a  href="#" className="px-4 font-bold text-text md:hover:text-secondary">Item 2</a></li>
              <li><a  href="#" className="px-4 font-bold md:hover:text-secondary text-text">Item 3</a></li>
            </ul>
          </div>
        </div>
        <div className="px-5 py-0.5 bg-base-100 rounded-full navbar-center">
          <div>
            <button type="submit">
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 17 17" className="object-contain w-4 h-4 fill-current">
                <path d="M16.3 14.2L11.9 10.6C12.7 9.5 13.2 8.1 13.2 6.6 13.2 3 10.2 0 6.6 0 3 0 0 3 0 6.6 0 10.3 3 13.2 6.6 13.2 8.1 13.2 9.5 12.7 10.6 11.9L14.1 16.4C15 17.3 16 17.1 16.6 16.4 17.1 15.7 17.2 15 16.3 14.2ZM6.6 11.2C4.1 11.2 2 9.1 2 6.6 2 4.1 4.1 2 6.6 2 9.1 2 11.2 4.1 11.2 6.6 11.2 9.1 9.1 11.2 6.6 11.2Z"></path>
              </svg>
            </button>
            <Input className="" type="text" />
          </div>
        </div>
        <div className="navbar-end">
          <a href="#" className="font-bold text-text">Login</a>
          <a href="#" className="pl-4 text-2xl">
            <CiShoppingCart />
          </a>
        </div>
      </div>
    </header>
  )
}

Header.defaultProps = {
  title: 'Huma'
};

export default Header;