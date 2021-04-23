import React from "react";

interface DocType {
  document_list_id: number;
  name: string;
  description: string;
  location_url: string;
  category: string;
  created_date: string;
}

interface DocumentsType {
  documents: DocType[];
}

const Documents: React.FC<DocumentsType> = properties => {
  const { documents } = properties;
  return (
    <div className="mt-4">
      <table className="min-w-max w-full table-auto -mx-2">
        <thead className="bg-pacific-100 text-green-800 uppercase text-xs">
          <tr>
            <th className="py-2 px-2 text-left">ID</th>
            <th className="py-2 px-2 text-left">Name</th>
            <th className="py-2 px-2 text-left">Description</th>
            <th className="py-2 px-2 text-left">Category</th>
            <th className="py-2 px-2 text-left">Created date</th>
          </tr>
        </thead>
        <tbody className="text-gray-600 text-sm">
          {documents.map((doc, id) => (
            <tr key={id} className={`border-b border-gray-200 ${id % 2 === 0 ? "" : "bg-pacific-50 bg-opacity-50"}`}>
              <td className="py-2 px-2">{doc.document_list_id}</td>
              <td className="py-2 px-2 text-denim-600 font-medium">
                <a href={doc.location_url} target="_blank" rel="noreferrer">
                  {doc.name}
                </a>
              </td>
              <td className="py-2 px-2">{doc.description}</td>
              <td className="py-2 px-2">{doc.category}</td>
              <td className="py-2 px-2">{doc.created_date}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default Documents;
