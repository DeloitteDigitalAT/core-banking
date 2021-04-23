import React from "react";
import renderer from "react-test-renderer";
import Tabs from "../Tabs";

const mockElements = [
  {
    name: "tab name 1",
    id: 1,
    active: true,
  },
  {
    name: "tab name 2",
    id: 2,
    active: false,
  },
];

describe("UI/Tabs component", () => {
  test("snapshot renders", () => {
    const tree = renderer.create(<Tabs elements={mockElements} setElements={() => {}} />).toJSON();
    expect(tree).toMatchSnapshot();
  });
});
