import { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import { Form, Button } from "react-bootstrap";
import axios from "axios";

const SearchProduct = () => {
  const navigate = useNavigate();
  const [search, setSearch] = useState("");
  const [products, setProducts] = useState([]);

  console.log(products);

  const authToken = localStorage.getItem("token");

  useEffect(() => {
    if (!authToken) {
      navigate("/login");
    }
  }, [authToken, navigate]);

  const handleSearch = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.get(
        `http://localhost:4000/api/search/products?search=${search}`,
        {
          headers: {
            Authorization: `Bearer ${localStorage.getItem("token")}`,
          },
        }
      );
      if (response.status == 200) {
        setProducts(response.data.products);
      }
    } catch (error) {
      console.log(error.message);
    }
  };

  console.log(products.length);
  return (
    <div className="container-form">
      <Form onSubmit={handleSearch} className="d-flex search-form container-sm">
        <Form.Control
          type="search"
          onChange={(e) => setSearch(e.target.value)}
          value={search}
          placeholder="Search Product"
          className="me-2"
          aria-label="Search"
        />
        <Button type="submit" variant="secondary">
          Search
        </Button>
      </Form>
      {products.length > 0 ? (
        <div className="listdata mt-5">
          <h3>Books List</h3>
          <div className="main table-responsive">
            <table className="table table-striped">
              <thead>
                <tr>
                  <th>Title</th>
                  <th>Description</th>
                  <th>Prices</th>
                  <th>Category</th>
                </tr>
              </thead>
              <tbody>
                {products.map((product) => {
                  return (
                    <tr key={product?.productId}>
                      <td>{product?.productName}</td>
                      <td>{product?.productDesc}</td>
                      <td>{product?.productPrice}</td>
                      <td>{product?.categoryName}</td>
                    </tr>
                  );
                })}
              </tbody>
            </table>
          </div>
        </div>
      ) : (
        ""
      )}
    </div>
  );
};

export default SearchProduct;
