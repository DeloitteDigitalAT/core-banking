import React from "react";

interface InputType {
  label: string;
  placeholder: string;
  value: string;
  required: boolean;
  error: boolean;
  setInput: (el: string) => void;
}

const Input: React.FC<InputType> = properties => {
  const { label, placeholder, value, setInput, required, error } = properties;
  return (
    <label className="block py-2 mt-4">
      <span className="text-gray-700">
        {label}
        {required ? " *" : null}
      </span>
      <input
        className={`max-w-xl form-input mt-1 block w-full border rounded py-2 px-2 ${error ? "border-mango-600" : ""}`}
        placeholder={placeholder}
        value={value}
        onChange={el => setInput(el.target.value)}
      />
    </label>
  );
};

export default Input;
