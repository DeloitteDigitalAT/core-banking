import React from "react";
import renderer from "react-test-renderer";
import Button from "../Button";

describe("UI/Button component", () => {
  test("snapshot renders", () => {
    const tree = renderer.create(<Button text="" handler={() => {}} active />).toJSON();
    expect(tree).toMatchSnapshot();
  });
});
