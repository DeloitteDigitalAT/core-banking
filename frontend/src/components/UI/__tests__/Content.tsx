import React from "react";
import renderer from "react-test-renderer";
import Content from "../Content";

describe("UI/Content component", () => {
  test("snapshot renders", () => {
    const tree = renderer.create(<Content />).toJSON();
    expect(tree).toMatchSnapshot();
  });
});
