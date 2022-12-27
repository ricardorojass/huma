import * as React from 'react'
import { Button, Container, Row, Col } from 'react-bootstrap';

class Header extends React.Component {

  render() {
    return (
      <Container fluid className='header'>
        <Row>
          <Col>
            <span>{this.props.title}</span>
          </Col>
          <Col>
            <Button variant="primary" onClick={() => alert('login clicked')}>Login</Button>
            <Button variant="secondary" onClick={() => alert('register clicked')}>Register</Button>
          </Col>
        </Row>
      </Container>
    )
  }
}

Header.defaultProps = {
  title: 'Huma'
};

export default Header;