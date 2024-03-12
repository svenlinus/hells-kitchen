import { useState } from 'react'
import React from 'react'
import './App.css'
import IngredientsSearch from './components/search'
import { AppBar, Box, Button, CssBaseline, Menu, ThemeProvider, Toolbar, createTheme } from '@mui/material';
import logo from './assets/gr.png';
import { BrowserRouter as Router, Route, Routes, Link } from 'react-router-dom';
import AddIngredients from './components/add';


const darkTheme = createTheme({
  palette: {
    mode: 'dark',
    primary: {
      main: '#3a6ab6'
    },
    secondary: {
      main: '#000'
    },
  },
});

function App() {
  return (
    <div className="main">
      <ThemeProvider theme={darkTheme}>
        <CssBaseline />
        <Router>
          <div>
            <AppBar position="static">
              <Toolbar>
                <img src={logo} height="40px" />
                <Box sx={{ marginLeft: '50px', display: 'flex', flexGrow: 1, gap: '30px' }}>
                  <Link to="/">
                    <Button
                      sx={{ my: 2, color: 'white', backgroundColor: '#222', display: 'block' }}
                      onClick={() => {}}>
                      FIND
                    </Button>
                  </Link>
                  <Link to="/add">
                    <Button
                      sx={{ my: 2, color: 'white', backgroundColor: '#222', display: 'block' }}>
                      ADD
                    </Button>
                  </Link>
                </Box>
              </Toolbar>
            </AppBar>
            <Routes>
              <Route path="/" element={<IngredientsSearch/>} />
              <Route path="/add" element={<AddIngredients/>}/>
            </Routes>
          </div>
        </Router>
      </ThemeProvider>
    </div>
  )
}

export default App
