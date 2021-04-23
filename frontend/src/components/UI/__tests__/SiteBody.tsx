import React from "react";
import renderer from "react-test-renderer";
import SiteBody from "../SiteBody";

describe("UI/SiteBody component", () => {
  test("snapshot renders", () => {
    const tree = renderer.create(<SiteBody />).toJSON();
    expect(tree).toMatchSnapshot();
  });
});
