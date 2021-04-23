import React from "react";
import renderer from "react-test-renderer";
import Header from "../Header";

describe("UI/Header component", () => {
  test("snapshot renders", () => {
    const tree = renderer.create(<Header />).toJSON();
    expect(tree).toMatchSnapshot();
  });
});
