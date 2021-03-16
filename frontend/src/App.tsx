import React from "react";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";
import PageMain from "./pages/Main";

const App: React.FC = () => {
  return (
    <Router>
      <Switch>
        <Route component={PageMain} />
      </Switch>
    </Router>
  );
};

export default App;
