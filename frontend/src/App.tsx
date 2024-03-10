import { useState } from 'react'
import React from 'react'
import './App.css'
import IngredientsSearch from './components/search'
import { CssBaseline, ThemeProvider, createTheme } from '@mui/material';

const darkTheme = createTheme({
  palette: {
    mode: 'dark',
  },
});

function App() {
  return (
    <ThemeProvider theme={darkTheme}>
      <CssBaseline />
      <IngredientsSearch />
    </ThemeProvider>
  )
}

export default App
