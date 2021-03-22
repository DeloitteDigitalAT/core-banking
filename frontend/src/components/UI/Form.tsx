import React, { useState, useEffect } from "react";
import Input from "./Input";
import Button from "./Button";

enum FormElementType {
  input = "input",
  button = "button",
}

interface ElementInputType {
  id: number;
  type: FormElementType;
  label: string;
  placeholder: string;
  value: string;
  required: boolean;
  error?: boolean;
  text?: never;
  handler?: never;
  active?: never;
}

interface ElementButtonType {
  id: number;
  type: FormElementType;
  text: string;
  handler: () => void;
  actibe?: boolean;
  required?: never;
  error?: never;
  value?: never;
  label?: never;
  placeholder?: never;
}

type ElementType = ElementInputType | ElementButtonType;

interface FormType {
  elements: ElementType[];
  setForm: (el: ElementType[]) => void;
}

const Form: React.FC<FormType> = properties => {
  const { elements, setForm } = properties;
  const [formError, setFormError] = useState("");
  useEffect(() => {
    setFormError("");
  }, []);
  const checkErrors = () => {
    const updElements = [...elements].map(element => {
      if (element.type === FormElementType.input && element.required && !element.value) {
        element.error = true;
      }
      return element;
    });
    if (!elements.find(e => e.error)) {
      setFormError("");
    }
    setForm(updElements);
  };
  const changeForm = (id: number, newValue: string) => {
    const updElements = [...elements].map(element => {
      if (element.id === id && element.type === FormElementType.input) {
        if (element.error && newValue.length) {
          element.error = false;
        }
        if (element.error && !newValue.length) {
          element.error = true;
        }
        element.value = newValue;
      }
      return element;
    });
    setForm(updElements);
  };
  const clearForm = () => {
    const updElements = [...elements].map(element => {
      if (element.type === FormElementType.input && element.value) {
        element.value = "";
        element.error = false;
      }
      return element;
    });
    setForm(updElements);
  };

  return (
    <div>
      {elements.map(element => {
        if (element.type === FormElementType.input) {
          return (
            <Input
              key={element.id}
              label={element.label!}
              placeholder={element.placeholder!}
              value={element.value!}
              required={element.required!}
              error={element.error!}
              setInput={value => {
                changeForm(element.id, value);
              }}
            />
          );
        }
        if (element.type === FormElementType.button) {
          return (
            <Button
              key={element.id}
              text={element.text!}
              active={!elements.find(e => e.error)}
              handler={() => {
                if (elements.find(e => e.required && !e.value)) {
                  checkErrors();
                  setFormError("Required fields must be filled in");
                } else {
                  setFormError("");
                  element.handler!();
                  clearForm();
                }
              }}
            />
          );
        }
        return null;
      })}
      {elements.find(e => e.error) && <p>{formError}</p>}
    </div>
  );
};

export default Form;
