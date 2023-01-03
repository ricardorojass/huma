
/** @jsx jsx */
import {jsx, keyframes} from '@emotion/react'
import styled from '@emotion/styled'
import * as colors from '../styles/colors'
import * as mq from '../styles/media-queries'

const spin = keyframes({
  '0%': {transform: 'rotate(0deg)'},
  '100%': {transform: 'rotate(360deg)'},
})

const Input = styled.input({
  border: '0 solid #f1f1f4',
  background: colors.base,
  padding: '8px 12px',
  width: '25vw'
})

const FormGroup = styled.div({
  display: 'flex'
})

const buttonVariants = {
  primary: {
    background: colors.indigo,
    color: colors.base,
  },
  secondary: {
    background: colors.gray,
    color: colors.text,
  },
}
const Button = styled.button(
  {
    padding: '10px 15px',
    border: '0',
    lineHeight: '1',
  },
  ({variant = 'primary'}) => buttonVariants[variant],
)

export {Button, Input, FormGroup}