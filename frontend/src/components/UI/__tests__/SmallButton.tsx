import React from "react";
import renderer from "react-test-renderer";
import SmallButton from "../SmallButton";

describe("UI/SmallButton component", () => {
  test("snapshot renders", () => {
    const tree = renderer.create(<SmallButton text="" handler={() => {}} active extraClass="" />).toJSON();
    expect(tree).toMatchSnapshot();
  });
});
