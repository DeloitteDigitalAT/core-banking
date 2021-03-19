import React from "react";

interface ButtonType {
  text: string;
  handler: () => void;
  active: boolean;
}

const Button: React.FC<ButtonType> = properties => {
  const { text, handler, active } = properties;
  return (
    <button
      type="button"
      className={`${
        active ? "bg-green-500 border-green-500 hover:bg-green-700" : "bg-green-200 "
      } border   text-white rounded-md px-6 py-2 my-4 transition duration-500 ease select-none focus:outline-none focus:shadow-outline`}
      onClick={handler}
    >
      {text}
    </button>
  );
};

export default Button;
