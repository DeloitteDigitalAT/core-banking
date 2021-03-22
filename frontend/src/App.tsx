import React from "react";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";
import PageMain from "./pages/Main";
import { SiteBody, Top, Bottom, Content } from "./components/UI";

const App: React.FC = () => {
  return (
    <Router>
      <SiteBody>
        <Top />
        <Content>
          <Switch>
            <Route component={PageMain} />
          </Switch>
        </Content>
        <Bottom />
      </SiteBody>
    </Router>
  );
};

export default App;
