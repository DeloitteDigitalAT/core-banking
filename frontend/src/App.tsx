import React from "react";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";
import PageMain from "./pages/Main";
import { SiteBody, TopMenu, Bottom, Content } from "./components/UI";

const App: React.FC = () => {
  return (
    <Router>
      <SiteBody>
        <TopMenu />
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
