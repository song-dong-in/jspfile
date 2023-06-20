package user;


import dto.Product; 

public class ProductRepository {
	private Product phone;
	private Product notebook;
	private Product tablet;
	private static ProductRepository instance;
   
	
	public ProductRepository() {
       

		phone = createPhone();
		notebook = createNotebook();
		tablet = createTablet();
	}
	
	//신규 상품 데이터를 저장하는 메소드 만들기
	 public static synchronized ProductRepository getInstance() {
	        if (instance == null) {
	            instance = new ProductRepository();
	        }
	        return instance;
	    }
	 
	 //신규 상품데이터를 저장하는 메소드
	 public void addProduct(Product product) {
		    // 새로운 상품을 생성할 때마다 phone, notebook, tablet을 새로 생성하도록 수정
		    phone = createPhone();
		    notebook = createNotebook();
		    tablet = createTablet();
		    
		    
		    // 새로운 상품을 추가
		    if (product.getProductId().equals(phone.getProductId())) {
		        phone = product;
		    } else if (product.getProductId().equals(notebook.getProductId())) {
		        notebook = product;
		    } else if (product.getProductId().equals(tablet.getProductId())) {
		        tablet = product;
		    } else {
		        // 새로운 상품의 ID와 일치하는 상품이 없을 경우, 여기에 처리할 내용 추가
		    }
		}
				
	 
	private Product createPhone() {
		Product phone = new Product("P1234", "논페이드 와이드 데님 슬랙스", 47900);
		phone.setDescription("-논페이드 데님으로 제작하여<br>" + "외부 이염이 없는 아이템입니다!<br><br>" + "-여름에 입기 좋은 시원한 소재의 두께감이에요<br><br>"
		+ "-슬랙스 아웃핏을 전제로 한 데님 팬츠라<br>" + "캐쥬얼함과 포멀함을 함께 느낄수 있는<br>" + "캐쥬얼하게 드레스업 하기에도 좋은 특별한 아이템이에요~<br><br>"
		+ "-반밴딩으로 사이즈의 여유로움을 주었습니다.<br><br>" + "YKK지퍼 니트 염색단추등 부자재에도 신경쓴<br>" +"퀄리티 좋은 제품이에요");
		
		return phone;
	}
	
	private Product createNotebook() {
		Product notebook = new Product("P1235", "302 쿨 린넨 와이드 데님", 42900);
		notebook.setDescription("-편하고 시원하게 제작된 린넨 데님 와이드 팬츠에요!<br><br>" + "-린넨 특유의 흐늘거리는 느낌과<br>"+
				"얇고 가벼워서 편하게 착용이 가능해요~<br><br>" + "-안쪽 허리부분에 고무줄 밴딩 처리로<br>"+ "여유있게 입으실 수 있도록 제작된 데님입니다.");
		return notebook;
	}
	
	private Product createTablet() {
		Product tablet = new Product("P1236", "수피마 세미와이드 쭈리 팬츠", 44900);
		tablet.setDescription("-면 소재의 캐시미어 수피마 원단으로 제작한<br>" +"고급스럽고 탄탄한 쭈리 팬츠입니다.<br><br>"+"-세미와이드핏으로 핏이 오버하지 않아<br>"+"부담없이 데일리로 활용도 좋을 실루엣입니다!<br><br>"+
				"-허리에는 엘라스틴 밴드를 적용하여<br>"+"편안한 착용감을 제공하며 스트링을 이용하여<br>" + "간편하게 허리 사이즈를 조절할 수 있어요~");
		return tablet;
	}
	
	public Product getPhone() {
		return phone;
	}
	
	public Product getNotebook() {
		return notebook;
	}
	
	public Product getTablet() {
		return tablet;
	}
	
	
	
	
	public Product getProductById(String productId) {
		if (phone.getProductId().equals(productId)) {
			return phone;
		} else if (notebook.getProductId().equals(productId)) {
			return notebook;
		} else if (tablet.getProductId().equals(productId)) {
			return tablet;
		
		}else {
			return null;
		}
	}
}