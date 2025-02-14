const ProtectedRoute = ({ children, allowedRoles }) => {
    const storedRole = localStorage.getItem('role');
    console.log("🔹 Checking ProtectedRoute - Role:", storedRole);  // ✅ ดูว่า role ที่ตรวจสอบเป็นอะไร
  
    if (!isLoggedIn) {
      return <Navigate to="/login" replace />;
    }
    if (!allowedRoles.includes(storedRole)) {
      console.warn("❌ Unauthorized access: Redirecting to home");
      return <Navigate to="/" replace />;
    }
    return children;
  };
  