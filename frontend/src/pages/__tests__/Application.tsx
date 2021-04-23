import React from "react";
import renderer from "react-test-renderer";
import { createMemoryHistory } from "history";
import Application from "../Application";

const history = createMemoryHistory();
const match = { params: { applicationID: "123" }, isExact: true, path: "/", url: "" };
const location = { pathname: "/", search: "", hash: "", state: undefined, key: "1" };

describe("UI/Application page", () => {
  test("snapshot renders", () => {
    const tree = renderer.create(<Application match={match} history={history} location={location} />).toJSON();
    expect(tree).toMatchSnapshot();
  });
});
