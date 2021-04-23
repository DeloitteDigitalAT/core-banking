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
        active
          ? "bg-gradient-to-b from-green-400 via-green-500 to-green-600 border-green-500 hover:from-green-600 hover:via-green-700 hover:to-green-800"
          : "bg-gradient-to-b from-green-100 via-green-200 to-green-100 border-green-100"
      } text-sm border text-white rounded-md px-6 py-2 my-4 transition duration-500 ease select-none focus:outline-none focus:shadow-outline`}
      onClick={handler}
    >
      {text}
    </button>
  );
};

export default Button;
