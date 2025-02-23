document.addEventListener('DOMContentLoaded', function () {
    document.querySelectorAll('.ingredient').forEach(item => {
      item.addEventListener('mouseover', (e) => {
        const info = e.target.getAttribute('data-info');
        const tooltip = document.createElement('div');
        tooltip.className = 'tooltip';
        tooltip.style.position = 'absolute';
        tooltip.style.backgroundColor = '#fff';
        tooltip.style.border = '1px solid #ccc';
        tooltip.style.padding = '5px';
        tooltip.style.zIndex = '1000';
        tooltip.style.whiteSpace = 'nowrap';
        tooltip.style.boxShadow = '0 2px 6px rgba(0,0,0,0.2)';
        tooltip.innerText = info;
  
        document.body.appendChild(tooltip);
  
        const rect = e.target.getBoundingClientRect();
        const tooltipRect = tooltip.getBoundingClientRect();
  
        let left = rect.left + window.scrollX;
        let top = rect.bottom + window.scrollY + 5;
  
        if (left + tooltipRect.width > window.innerWidth) {
          left = window.innerWidth - tooltipRect.width - 10;
        }
  
        if (left < 0) {
          left = 10;
        }
  
        tooltip.style.left = `${left}px`;
        tooltip.style.top = `${top}px`;
  
        e.target.addEventListener('mouseout', () => {
          tooltip.remove();
        }, { once: true });
      });
    });
  });