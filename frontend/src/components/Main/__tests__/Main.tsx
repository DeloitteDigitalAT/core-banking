import React from "react";
import renderer from "react-test-renderer";
import Main from "../Main";

describe("Main component", () => {
  test("snapshot renders", () => {
    const tree = renderer.create(<Main />).toJSON();
    expect(tree).toMatchSnapshot();
  });
});
