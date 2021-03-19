import React, { useState } from "react";
import { Header, Tabs, Form } from "../components/UI";

const Main: React.FC = () => {
  const [tabsElements, setTabsElements] = useState([
    { name: "Search by Name", id: 1, active: true },
    { name: "Search by Application ID", id: 2, active: false },
  ]);
  enum FormElementType {
    input = "input",
    button = "button",
  }
  const [formName, setFormName] = useState([
    {
      id: 1,
      type: FormElementType.input,
      label: "First Name",
      placeholder: "John",
      value: "",
      required: false,
    },
    {
      id: 2,
      type: FormElementType.input,
      label: "Last Name",
      placeholder: "Doe",
      value: "",
      required: true,
    },
    {
      id: 3,
      type: FormElementType.button,
      text: "Search",
      handler: () => {},
    },
  ]);
  const [formID, setFormID] = useState([
    {
      id: 1,
      type: FormElementType.input,
      label: "Application ID",
      placeholder: "123456",
      value: "",
      required: true,
    },
    {
      id: 3,
      type: FormElementType.button,
      text: "Search",
      handler: () => {},
    },
  ]);
  const activeTabId = tabsElements.find(el => el.active)?.id;
  return (
    <div className="flex-grow">
      <Header>Search customer application</Header>
      <Tabs elements={tabsElements} setElements={setTabsElements} />
      {activeTabId === 1 && <Form elements={formName} setForm={setFormName} />}
      {activeTabId === 2 && <Form elements={formID} setForm={setFormID} />}
    </div>
  );
};

export default Main;
