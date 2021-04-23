import React from "react";
import renderer from "react-test-renderer";
import Bottom from "../Bottom";

describe("UI/Bottom component", () => {
  test("snapshot renders", () => {
    const tree = renderer.create(<Bottom />).toJSON();
    expect(tree).toMatchSnapshot();
  });
});
