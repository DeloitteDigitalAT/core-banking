import React from "react";
import renderer from "react-test-renderer";
import Application from "../Application";

describe("Application component", () => {
  test("snapshot renders", () => {
    const tree = renderer.create(<Application applicationID="1" />).toJSON();
    expect(tree).toMatchSnapshot();
  });
});
