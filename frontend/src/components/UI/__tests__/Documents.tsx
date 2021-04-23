import React from "react";
import renderer from "react-test-renderer";
import Documents from "../Documents";

const mockDock = [
  {
    document_list_id: 1,
    name: "name",
    description: "description",
    location_url: "url",
    category: "category",
    created_date: "created date",
  },
];

describe("UI/Documents component", () => {
  test("snapshot renders", () => {
    const tree = renderer.create(<Documents documents={mockDock} />).toJSON();
    expect(tree).toMatchSnapshot();
  });
});
