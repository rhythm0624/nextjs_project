"use client";
import { useState } from "react";

export default function FeedbackForm() {
  const [rating, setRating] = useState(0);
  const [comment, setComment] = useState("");
  const [submitted, setSubmitted] = useState(false); // ⭐ NEW

  const handleSubmit = () => {
    setSubmitted(true);
  };

  return (
    <div style={styles.container}>
      {!submitted ? (
        <>
          <h1>Feedback form</h1>

          {/* ⭐ STAR RATING */}
          <div style={styles.stars}>
            {[1, 2, 3, 4, 5].map((star) => (
              <span
                key={star}
                onClick={() => setRating(star)}
                style={{
                  cursor: "pointer",
                  color: star <= rating ? "gold" : "gray",
                }}
              >
                ★
              </span>
            ))}
          </div>

          {/* 💬 COMMENT */}
          <input
            type="text"
            placeholder="Write your feedback"
            value={comment}
            onChange={(e) => setComment(e.target.value)}
            style={styles.input}
          />

          {/* 🔘 SUBMIT */}
          <button onClick={handleSubmit} style={styles.button}>
            Submit
          </button>
        </>
      ) : (
        <h2>Thank you for your feedback 😊</h2>
      )}
    </div>
  );
}

const styles = {
  container: {
    textAlign: "center",
    padding: "40px",
  },
  stars: {
    fontSize: "30px",
    marginBottom: "20px",
  },
  input: {
    width: "300px",
    padding: "10px",
    marginBottom: "15px",
  },
  button: {
    padding: "10px 20px",
    cursor: "pointer",
  },
};
