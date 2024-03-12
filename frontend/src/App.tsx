import { useState } from 'react'
import React from 'react'
import './App.css'
import IngredientsSearch from './components/search'
import { CssBaseline, ThemeProvider, createTheme } from '@mui/material';

const darkTheme = createTheme({
  palette: {
    mode: 'dark',
    primary: {
      // dark: 'rgb(51, 116, 255)',
      main: '#3a6ab6'
    }
  },
});

function App() {
  return (
    <div className="main">
      <ThemeProvider theme={darkTheme}>
        <CssBaseline />
        <IngredientsSearch />
      </ThemeProvider>
    </div>
  )
}

export default App
