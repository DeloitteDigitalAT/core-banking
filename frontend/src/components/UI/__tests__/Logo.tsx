import React from "react";
import renderer from "react-test-renderer";
import Logo from "../Logo";

describe("UI/Logo component", () => {
  test("snapshot renders", () => {
    const tree = renderer.create(<Logo w={24} h={24} color="#323232" />).toJSON();
    expect(tree).toMatchSnapshot();
  });
});
