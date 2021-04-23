import React from "react";
import renderer from "react-test-renderer";
import Form from "../Form";

const mockForm = [
  {
    id: 1,
    type: "input",
    label: "Credit amount requested",
    placeholder: "",
    value: "123",
    required: false,
    readonly: true,
    error: false,
    divClass: "col-span-3 md:col-span-2",
  },
  {
    id: 2,
    type: "input",
    label: "Interest rate",
    placeholder: "",
    value: "456",
    required: false,
    readonly: true,
    error: false,
    divClass: "col-span-3 md:col-span-1 pl-4",
  },
  {
    id: 3,
    type: "input",
    label: "Planned emi",
    placeholder: "",
    value: "789",
    required: false,
    readonly: true,
    error: false,
    divClass: "col-span-3 md:col-span-1 md:pl-4",
  },
  {
    id: 4,
    type: "input",
    label: "Duration in months",
    placeholder: "",
    value: "24",
    required: false,
    readonly: true,
    error: false,
    divClass: "col-span-3 md:col-span-2 pl-4",
  },
  {
    id: 5,
    type: "button",
    text: "Search",
    handler: () => {},
    divClass: "col-span-6",
  },
];

describe("UI/Form component", () => {
  test("snapshot renders", () => {
    const tree = renderer.create(<Form elements={mockForm} setForm={() => {}} />).toJSON();
    expect(tree).toMatchSnapshot();
  });
});
