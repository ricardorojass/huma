import * as React from 'react'

class Header extends React.Component {

  render() {
    return (
      <header>
        <span>{this.props.title}</span>
        <div>
          <button onClick={() => alert('login clicked')}>Login</button>
        </div>
        <div>
          <button onClick={() => alert('register clicked')}>Register</button>
        </div>
      </header>
    )
  }
}

Header.defaultProps = {
  title: 'Huma'
};

export default Header;