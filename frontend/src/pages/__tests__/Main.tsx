import React from "react";
import renderer from "react-test-renderer";
import Main from "../Main";

describe("UI/Main page", () => {
  test("snapshot renders", () => {
    const tree = renderer.create(<Main />).toJSON();
    expect(tree).toMatchSnapshot();
  });
});
