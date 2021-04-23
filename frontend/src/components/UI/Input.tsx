import React from "react";

interface InputType {
  label: string;
  placeholder: string;
  value: string;
  required: boolean;
  error: boolean;
  readonly: boolean;
  setInput: (el: string) => void;
}

const Input: React.FC<InputType> = properties => {
  const { label, placeholder, value, setInput, required, error, readonly } = properties;
  return (
    <label className="block mt-4">
      <span className="block uppercase tracking-wide text-xs font-semibold mb-2 text-gray-700">
        {label}
        {required ? " *" : null}
      </span>
      <input
        className={`form-input mt-1 block w-full text-sm border rounded py-2 px-2 ${error ? "border-mango-600" : ""} ${
          readonly ? "outline-none" : ""
        }`}
        placeholder={placeholder}
        value={value}
        onChange={el => setInput(el.target.value)}
        readOnly={readonly}
      />
    </label>
  );
};

export default Input;
