import React from "react";
import { RouteComponentProps } from "react-router-dom";
import Application from "../components/Application/Application";

interface MatchParams {
  applicationID: string;
}

const PageApplication: React.FC<RouteComponentProps<MatchParams>> = properties => {
  const { applicationID } = properties.match.params;
  return <Application applicationID={applicationID} />;
};

export default PageApplication;
